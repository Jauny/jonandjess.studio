const getScaleForRange = function(el, start, end, viewport) {
  const elTop = el.getBoundingClientRect().top
  const factor = (viewport - elTop) / viewport

  const range = start - end
  let scale = start - (range * factor)
  if (start < end) {
    scale = Math.min(end, Math.max(scale, start))
  } else {
    scale = Math.max(end, Math.min(scale, start))
  }
  return scale
}

const scrollScale = function(el, start, end, viewport) {
  const scale = getScaleForRange(el, start, end, viewport)
  el.style.transform = `scale(${scale})`
}

const scrollStrafing = function(el, start, end, viewport) {
  const scale = getScaleForRange(el, start, end, viewport)
  el.style.transform = `translateX(${scale}px)`
}
