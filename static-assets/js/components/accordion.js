(function() {
  let accordions = document.querySelectorAll('.ice-accordion');
  let collapseEls = document.querySelectorAll('.ice-accordion-collapse');
  const utils = iceBootstrap.utils;

  // Queries all accordions and their collapse elements and updates stored values
  const setElements = () => {
    accordions = document.querySelectorAll('.ice-accordion');
    collapseEls = document.querySelectorAll('.ice-accordion-collapse');
  };

  // Open all collapse components
  const showAccordionItems = () => {
    collapseEls.forEach((collapse) => {
      collapse.classList.add('show');
    });
  }

  // Restore accordions states (only one item open)
  const restoreClosedAccordionItems = () => {
    collapseEls.forEach((collapse, index) => {
      if (index !== 0) {
        collapse.classList.remove('show');
      }
    });
  };

  // Initialize function (when loading an accordion component)
  const onInitialize = (accordionId) => {
    setElements();
    if (iceBootstrap.utils.isEditMode()) {
      const buttons = document.getElementById(accordionId).querySelectorAll('.accordion-button');
      utils.nodeListRemoveAttribute(buttons, 'data-bs-toggle');
      showAccordionItems();
    }
  }

  // Registers accordion component into iceBootstrap
  iceBootstrap.register('accordion', {
    onEditModeOn: () => {
      // On all accordions, look for buttons and remove their bootstrap toggle prop so
      // while on editMode they won't toggle items.
      accordions.forEach((accordion) => {
        const buttons = accordion.querySelectorAll('.accordion-button');
        utils.nodeListRemoveAttribute(buttons, 'data-bs-toggle');
      });
      showAccordionItems();
    },
    onEditModeOff: () => {
      // On all accordions, look for buttons and restore their bootstrap toggle prop so accordions
      // behave properly.
      accordions.forEach((accordion) => {
        const buttons = accordion.querySelectorAll('.accordion-button');
        utils.nodeListSetAttribute(buttons, 'data-bs-toggle', 'collapse');
      });
      restoreClosedAccordionItems();
    }
  });

  // Adds accordion component into iceBootstrap list of components and make it accessible via window.
  iceBootstrap.components['accordion'] = {
    initialize: (accordionId) => onInitialize(accordionId)
  }
})();