(function() {
  let dropdownToggles = document.querySelectorAll('.ice-dropdown .dropdown-toggle');
  const utils = iceBootstrap.utils;

  // Queries all dropdown elements and updates stored values
  const setElements = () => {
    dropdownToggles = document.querySelectorAll('.ice-dropdown .dropdown-toggle');
  };

  // Initialize function (when loading a dropdown component)
  const onInitialize = (dropdownId) => {
    setElements();
    if (iceBootstrap.utils.isEditMode()) {
      const dropdown = document.getElementById(dropdownId);
      dropdown.removeAttribute('data-bs-toggle');
    }
  };

  // Registers dropdown component into iceBootstrap
  // When iceMode is on, or iceBypass is off, remove bootstrap props from toggle elements.
  // When iceMode is off, or iceBypass is on, restore bootstrap props to toggle elements.
  iceBootstrap.register('dropdown', {
    iceBypassOn: () => utils.nodeListSetAttribute(dropdownToggles, 'data-bs-toggle', 'dropdown'),
    iceBypassOff: () => utils.nodeListRemoveAttribute(dropdownToggles, 'data-bs-toggle'),
    onEditModeOn: () => utils.nodeListRemoveAttribute(dropdownToggles,'data-bs-toggle'),
    onEditModeOff: () => utils.nodeListSetAttribute(dropdownToggles, 'data-bs-toggle', 'dropdown')
  });

  // Adds dropdown component into iceBootstrap list of components and make it accessible via window.
  iceBootstrap.components['dropdown'] = {
    initialize: (dropdownId) => onInitialize(dropdownId)
  }
})();