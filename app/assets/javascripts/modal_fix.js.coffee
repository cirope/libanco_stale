# Since confModal is essentially a nested modal it's enforceFocus method
# must be no-op'd or the following error results
# "Uncaught RangeError: Maximum call stack size exceeded"
# But then when the nested modal is hidden we reset modal.enforceFocus
enforceModalFocusFn = $.fn.modal.Constructor.prototype.enforceFocus

$.fn.modal.Constructor.prototype.enforceFocus = -> {}
