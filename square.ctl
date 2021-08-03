;Calculate the frequencies and states of the lowest five TM modes in the modified setup, at the Gamma, K, and M point.

(define myR (/ 1 2.78)); I used 3.16 for the shrunken and 2.78 for the extended phase
(define myD (/ (* 2 myR) 3))
(define myEd 8) ; I used 9.5 for the shrunkenan 8 for the extended phase

(set! num-bands 5)

(set! geometry-lattice (make lattice (size 1 1 no-size)
                         (basis1 (/ (sqrt 3) 2) -0.5)
                         (basis2 (/ (sqrt 3) 2) 0.5)))
(set! geometry (list
                    (make block
                       (center (* 1 myR) 0 0) (size myD myD infinity)
                       (material (make dielectric (epsilon myEd))))
                    (make block
                      (center 0 (* 1 myR)  0) (size myD myD infinity)
                      (material (make dielectric (epsilon myEd))))
                    (make block
                      (center (* -1 myR)  0 0) (size myD myD infinity)
                      (material (make dielectric (epsilon myEd))))
                    (make block
                      (center 0 (* -1 myR)  0) (size myD myD infinity)
                      (material (make dielectric (epsilon myEd))))
                    (make block
                      (center (* 1 myR)  (* -1 myR)  0) (size myD myD infinity)
                      (material (make dielectric (epsilon myEd))))
                    (make block
                      (center (* -1 myR)  (* 1 myR)  0) (size myD myD infinity)
                      (material (make dielectric (epsilon myEd))))

                       ))




(set! k-points (list (vector3 0.5 0.5 0) ; M2
                     (vector3 0 0 0)          ; Gamma
                     (vector3 0.5 0 0);M1
                     (vector3 (/ 2 3) (/ 3) 0);K
                     (vector3 (/ 3) (/ 2 3) 0);K'
                     (vector3 0 0.5 0);M3
                     (vector3 0 0 0)))
(set! k-points (interpolate 4 k-points))

(set! resolution 192)

(run-tm)
