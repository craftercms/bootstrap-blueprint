(function() {
  let forms = document.querySelectorAll('.ice-form');
  const formsLabelsAttrs = {};

  // Queries all forms elements and updates stored values
  const setElements = () => {
    forms = document.querySelectorAll('.ice-form');
  };

  // For each form, get all labels and store the 'for' attribute into the formsLabelsAttrs lookup table.
  forms.forEach((form) => {
    const id = form.getAttribute('id');
    const labels = form.querySelectorAll('label');
    const labelsAttrs = {};
    labels.forEach((label) => {
      const index = label.getAttribute('data-craftercms-index');
      labelsAttrs[index] = label.getAttribute('for');
    });
    formsLabelsAttrs[id] = labelsAttrs;
  });

  // Disable all form labels in all forms to avoid unwanted input focus while on editMode
  const disableForm = (form) => {
    const labels = form.querySelectorAll('label');
    labels.forEach((label) => {
      label.removeAttribute('for');
    });
    form.querySelector('.ice-submit').removeAttribute('type');
  }

  // Disable all forms
  const disableForms = () => {
    forms.forEach((form) => {
      disableForm(form);
    });
  };

  // Restore all labels 'for' attribute using the stored values in formsLabelsAttrs lookup table
  const restoreForm = () => {
    forms.forEach((form) => {
      const id = form.getAttribute('id');
      const labelsAttrs = formsLabelsAttrs[id];
      const labels = form.querySelectorAll('label');
      labels.forEach((label) => {
        const index = label.getAttribute('data-craftercms-index');
        label.setAttribute('for', labelsAttrs[index]);
      });
      form.querySelector('.ice-submit').setAttribute('type', 'submit');
    });
  }

  // Initialize function (when loading a form component)
  const onInitialize = (formId) => {
    setElements();
    if (iceBootstrap.utils.isEditMode()) {
      const form = document.getElementById(formId);
      disableForm(form);
    }
  };

  // Registers form component into iceBootstrap
  iceBootstrap.register('form', {
    iceBypassOn: () => restoreForm(),
    iceBypassOff: () => disableForms(),
    onEditModeOn: () => disableForms(),
    onEditModeOff: () => restoreForm()
  });

  // Adds button component into iceBootstrap list of components and make it accessible via window.
  iceBootstrap.components['form'] = {
    initialize: (formId) => onInitialize(formId)
  }
})();