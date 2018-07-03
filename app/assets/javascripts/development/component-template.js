window.GOVUK = window.GOVUK || {}
window.GOVUK.Modules = window.GOVUK.Modules || {};

(function (global, GOVUK) {
  'use strict'

  var $ = global.jQuery
  var componentSelectors = []
  var hiddenComponents = []

  GOVUK.Modules.ComponentTemplate = function () {
    this.start = function (element) {
      findComponents(element)
      addHoverState(componentSelectors)
    }
  }

  var findComponents = function(element) {
    element.children().each(function() {
      if ($(this).is('[class*="app-c"], [class*="pub-c"], [class*="gem-c"], [class*="govuk"]')) {
        componentSelectors.push({
          component: this,
          class: this.className
        })
      }

      else if ($(this).children().length > 0) {
        findComponents($(this))
      }
    });
  }

  var addHoverState = function(componentSelectors) {
    componentSelectors.forEach(function(componentObj) {
      $(componentObj.component).on("mouseenter", addHoverBehaviours.bind(event, componentObj.component, true))

      $(componentObj.component).on("mouseleave", addHoverBehaviours.bind(event, componentObj.component, false))
    })
  }

  function addHoverBehaviours(component, append) {
    hideComponentButton(component, append)
  }

  function editComponentButton(component, append) {
    var editComponentButtonClass = "component-template--edit"

    if (append) {
      var editComponentButton = document.createElement("button")
      editComponentButton.innerHTML = "Edit text"

      $(component).css({"position": "relative"})
      $(editComponentButton).css({
        "position": "absolute",
        "display": "block",
        "top": "0",
        "right": "150px",
        "border": "0",
        "outline": "0",
        "cursor": "pointer",
        "background-color": "#FFBF47",
        "text-decoration": "none",
        "color": "black",
        "padding": "5px 10px",
        "font-size": "16px",
        "z-index": "100"
      })

      $(editComponentButton).addClass(editComponentButtonClass)

      $(editComponentButton).on("click", function() {
        editComponentText(component)
      });

      component.appendChild(editComponentButton)
    }
    else {
      $("." + editComponentButtonClass, component).remove()
      $(component).attr('contenteditable','false');
    }
  }

  function hideComponentButton(component, append) {
    var hideComponentButtonClass = "component-template--hide"

    if (append) {
      var hideComponentButton = document.createElement("button")
      hideComponentButton.innerHTML = "Hide component"

      $(component).css({"position": "relative"})
      $(hideComponentButton).css({
        "position": "absolute",
        "display": "block",
        "top": "0",
        "right": "0",
        "border": "0",
        "outline": "0",
        "cursor": "pointer",
        "background-color": "#FFBF47",
        "text-decoration": "none",
        "color": "black",
        "padding": "5px 10px",
        "font-size": "16px",
        "z-index": "100"
      })
      $(hideComponentButton).addClass(hideComponentButtonClass)

      $(hideComponentButton).on("click", function() {
        hideComponent(component)
      });

      component.appendChild(hideComponentButton)
    }
    else {
      $("." + hideComponentButtonClass, component).remove()
    }
  }

  var hideComponent = function(component) {
    $(component).css({
      "display": "none",
      "visibility": "none"
    })

    hiddenComponents.push(component)
  }
})(window, window.GOVUK)

