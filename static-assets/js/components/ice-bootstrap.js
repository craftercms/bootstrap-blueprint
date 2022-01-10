(function() {
  const registeredComponents = {};
  const editModeEvent = 'craftercms.editMode'; // TODO: use guest constants - need to be exported from guest, also for iceBypass
  let isEditMode = false;

  const onKeyup = (e) => {
    // When 'z' key is up, goes through all registered components and calls the iceByPassOff function (to restore editMode behavior)
    if (e.key === 'z') {
      Object.values(registeredComponents).forEach((component) => {
        component.iceBypassOff?.();
      });
    }
  };

  // When 'z' key is pressed, goes through all registered components and calls the iceByPassOn function (to avoid editMode behavior)
  const onKeydown = (e) => {
    if (e.key === 'z') {
      Object.values(registeredComponents).forEach((component) => {
        component.iceBypassOn?.();
      });
    }
  };

  // Update registeredComponents and populate data (actions that will be called on different scenarios)
  const register = (name, data) => {
    if (!registeredComponents[name]) {
      registeredComponents[name] = data;
    }
  };

  // Remove an item from registered components.
  const deRegister = (name)=> {
    if (registeredComponents[name]) {
      delete registeredComponents[name];
    } else {
      console.log(`'${name}' is not registered`);
    }
  };

  // Utils
  // Set an attribute to a list of nodes
  const nodeListSetAttribute = (nodeList, attribute, value) => {
    nodeList.forEach((item) => {
      item.setAttribute(attribute, value);
    });
  };
  // Remove an attribute from a list of nodes.
  const nodeListRemoveAttribute = (nodeList, attribute) => {
    nodeList.forEach((item) => {
      item.removeAttribute(attribute);
    });
  };
  // Add a class to a list of nodes.
  const nodeListAddClass = (nodeList, className) => {
    nodeList.forEach((item) => {
      item.classList.add(className);
    });
  };
  // Remove a class from a list of nodes.
  const nodeListRemoveClass = (nodeList, className) => {
    nodeList.forEach((item) => {
      item.classList.remove(className);
    });
  };
  // end utils.

  const editModeAction = () => {
    Object.values(registeredComponents).forEach((component) => {
      if (isEditMode) {
        component.onEditModeOn?.();
      } else {
        component.onEditModeOff?.();
      }
    });
  };

  // When edit mode changes, this sets or removes events for keyup and keydown.
  document.addEventListener(editModeEvent, (e) => {
    isEditMode = e.detail;
    editModeAction();
    if (isEditMode) {
      document.addEventListener('keydown', onKeydown, false);
      document.addEventListener('keyup', onKeyup, false);
    } else {
      document.removeEventListener('keydown', onKeydown, false);
      document.removeEventListener('keyup', onKeyup, false);
    }
  });

  window.iceBootstrap = {
    register,
    deRegister,
    utils: {
      nodeListSetAttribute,
      nodeListRemoveAttribute,
      nodeListAddClass,
      nodeListRemoveClass,
      isEditMode: () => isEditMode
    },
    components: {}
  }
})();