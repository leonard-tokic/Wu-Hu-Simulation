;Calculate the frequencies and states of the lowest five TM modes in the Wu and Hu setup, at the Gamma, K, and M point.

(define myR (/ 1 2.78)); I used 3.1 for the expanded and 2.7 for the shrunken phase
(define myD (/ (/ 2 3) 3))
(define myEd 11.7)

(set! num-bands 5)

(set! geometry-lattice (make lattice (size 1 1 no-size)
                         (basis1 (/ (sqrt 3) 2) -0.5)
                         (basis2 (/ (sqrt 3) 2) 0.5)))
(set! geometry (list
                    (make cylinder
                       (center (* 1 myR) 0 0) (radius (/ myD 2)) (height infinity)
                       (material (make dielectric (epsilon myEd))))
                    (make cylinder
                      (center 0 (* 1 myR)  0) (radius (/ myD 2)) (height infinity)
                      (material (make dielectric (epsilon myEd))))
                    (make cylinder
                      (center (* -1 myR)  0 0) (radius (/ myD 2)) (height infinity)
                      (material (make dielectric (epsilon myEd))))
                    (make cylinder
                      (center 0 (* -1 myR)  0) (radius (/ myD 2)) (height infinity)
                      (material (make dielectric (epsilon myEd))))
                    (make cylinder
                      (center (* 1 myR)  (* -1 myR)  0) (radius (/ myD 2)) (height infinity)
                      (material (make dielectric (epsilon myEd))))
                    (make cylinder
                      (center (* -1 myR)  (* 1 myR)  0) (radius (/ myD 2)) (height infinity)
                      (material (make dielectric (epsilon myEd))))

                       ))




(set! k-points (list (vector3 0 0 0) ; Gamma
                     (vector3 0.5 0 0) ;M1
                     (vector3 (/ 2 3) (/ 3) 0);K
                     (vector3 0 0 0)));Gamma


(set! k-points (interpolate 4 k-points))

(set! resolution 256)

(run-tm)
