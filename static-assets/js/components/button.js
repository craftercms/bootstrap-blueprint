(function() {
  const buttonsBSProps = {};
  let buttons = document.querySelectorAll('.ice-btn');

  // Queries all buttons and updates stored values
  const setElements = () => {
    buttons = document.querySelectorAll('.ice-btn');
    populateButtonsProps();
  };

  // Obtain bootstrap props (like `data-bs-{something}`) from a button.
  const getButtonBSProps = (button) => {
    return button.getAttributeNames().filter((name) => name.startsWith('data-bs'));
  };

  // For each button, get its bootstrap props and store them on 'buttonsBSProps' lookup table.
  const populateButtonsProps = () => {
    buttons.forEach((button) => {
      const id = button.getAttribute('id');
      if (id) {
        const bsProps = getButtonBSProps(button);
        const buttonBSProps = {};
        bsProps.forEach((prop) => {
          buttonBSProps[prop] = button.getAttribute(prop);
        });
        buttonsBSProps[id] = buttonBSProps;
      }
    });
  };
  populateButtonsProps();

  // Remove all bootstrap props from all buttons.
  const clearButtonsBSProps = () => {
    buttons.forEach((button) => {
      const buttonBSProps = getButtonBSProps(button);
      buttonBSProps.forEach((prop) => {
        button.removeAttribute(prop);
      });
    });
  }

  // Restore buttons bootstrap props using the stored 'buttonsBSProps' lookup table.
  const restoreButtonsBSProps = () => {
    buttons.forEach((button) => {
      const id = button.getAttribute('id');
      if (Boolean(id)) {
        const buttonBSProps = buttonsBSProps[id];
        Object.entries(buttonBSProps).forEach(([key, value]) => {
          button.setAttribute(key, value);
        });
      }
    });
  }

  // Initialize function (when loading a button component)
  const onInitialize = (buttonId) => {
    setElements();
    if (iceBootstrap.utils.isEditMode()) {
      const button = document.getElementById(buttonId);
      const buttonBSProps = getButtonBSProps(button);
      buttonBSProps.forEach((prop) => {
        button.removeAttribute(prop);
      });
    }
  };

  // Registers button component into iceBootstrap
  iceBootstrap.register('button', {
    iceBypassOn: () => restoreButtonsBSProps(),
    iceBypassOff: () => clearButtonsBSProps(),
    onEditModeOn: () => clearButtonsBSProps(),
    onEditModeOff: () => restoreButtonsBSProps()
  });

  // Adds button component into iceBootstrap list of components and make it accessible via window.
  iceBootstrap.components['button'] = {
    initialize: (buttonId) => onInitialize(buttonId)
  }
})();