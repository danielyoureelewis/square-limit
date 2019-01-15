(require 2htdp/image)
(require racket/trace)

(define my-img (bitmap "/home/daniel/Pictures/space.png"))

(define (half-width my-img)
  (flip-horizontal
   (scale/xy (/ pi 10) 1 my-img)))

(define (half-height my-img)
  (flip-vertical
   (scale/xy 1 (/ pi 10) my-img)))

(define (square-width my-img)
  (if (> (image-width my-img) 10)
      (beside my-img (square-width (half-width my-img)))
      (beside my-img (scale/xy .01 1 my-img))))

(define (square-height my-img)
  (if (> (image-height my-img) 10)
      (above (square-height (half-height my-img)) my-img)
      (above (scale/xy 1 .01 my-img) my-img)))

(define (square-limit my-img)
  (square-width (square-height my-img)))
  
(define (mirror my-img)
  (above
   (beside (flip-horizontal my-img) my-img)
   (flip-vertical (beside (flip-horizontal my-img) my-img))))

(mirror (square-limit my-img))
