(function() {
  let closeButtons = document.querySelectorAll('.ice-alert .btn-close');
  const utils = iceBootstrap.utils;

  // Queries all alert elements and updates stored value
  const setElements = () => {
    closeButtons = document.querySelectorAll('.ice-alert .btn-close');
  };

  // Initialize function (when loading an alert component)
  const onInitialize = (alertId) => {
    setElements();
    if (iceBootstrap.utils.isEditMode()) {
      document.getElementById(alertId).removeAttribute('data-bs-dismiss');
    }
  };

  // Registers alert component into iceBootstrap
  iceBootstrap.register('alert', {
    iceBypassOn: () => utils.nodeListSetAttribute(closeButtons, 'data-bs-dismiss', 'alert'),
    iceBypassOff: () => utils.nodeListRemoveAttribute(closeButtons, 'data-bs-dismiss'),
    onEditModeOn: () => utils.nodeListRemoveAttribute(closeButtons, 'data-bs-dismiss'),
    onEditModeOff: () => utils.nodeListSetAttribute(closeButtons, 'data-bs-dismiss', 'alert')
  });

  // Adds alert component into iceBootstrap list of components and make it accessible via window.
  iceBootstrap.components['alert'] = {
    initialize: (alertId) => onInitialize(alertId)
  }
})();