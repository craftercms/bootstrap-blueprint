(function() {
  let collapseEls = document.querySelectorAll('.ice-collapse');
  let toggleButtons = document.querySelectorAll('.btn[data-bs-toggle="collapse"]');
  const utils = iceBootstrap.utils;

  // Queries all collapse elements and updates stored values
  const setElements = () => {
    collapseEls = document.querySelectorAll('.ice-collapse');
    toggleButtons = document.querySelectorAll('.btn[data-bs-toggle="collapse"]');
  };

  // Initialize function (when loading a collapse component)
  const onInitialize = () => {
    setElements();
    if (iceBootstrap.utils.isEditMode()) {
      openCollapseComponents();
    }
  };

  // Open all collapse elements (used when edit mode is on)
  const openCollapseComponents = () => {
    collapseEls.forEach((collapse) => {
      const collapseInstance = bootstrap.Collapse.getOrCreateInstance(collapse);
      collapseInstance.show();
    });
  }

  openCollapseComponents();

  // Registers collapse component into iceBootstrap
  // When editMode is on, remove bootstrap props from buttons that toggle the collapse elements.
  // When editMode is off, restore the bootstrap prop to toggle collapse elements.
  iceBootstrap.register('collapse', {
    onEditModeOn: () => utils.nodeListRemoveAttribute(toggleButtons, 'data-bs-toggle'),
    onEditModeOff: () => utils.nodeListSetAttribute(toggleButtons, 'data-bs-toggle', 'collapse')
  });

  // Adds collapse component into iceBootstrap list of components and make it accessible via window.
  iceBootstrap.components['collapse'] = {
    initialize: () => onInitialize()
  }
})();