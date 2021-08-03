(define myRs (/ 3.16))
(define myRe (/ 2.78))
(define myDs (/ (/ 2 3) 3))
(define myDe (/ (/ 2 3) 3))
(define myEd 11.7)

(set! geometry-lattice (make lattice (size 20 20 no-size)))

(define extendedCluster (list
                    (make cylinder
                       (center (* myRe (/ (sqrt 3) 2)) (* myRe -0.5) 0) (radius (/ myDe 2)) (height infinity)
                       (material (make dielectric (epsilon myEd))))
                    (make cylinder
                      (center (* myRe (/ (sqrt 3) 2)) (* myRe 0.5)  0) (radius (/ myDe 2)) (height infinity)
                      (material (make dielectric (epsilon myEd))))
                    (make cylinder
                      (center (* myRe (/ (sqrt 3) -2)) (* myRe 0.5) 0) (radius (/ myDe 2)) (height infinity)
                      (material (make dielectric (epsilon myEd))))
                    (make cylinder
                      (center (* myRe (/ (sqrt 3) -2)) (* myRe -0.5)  0) (radius (/ myDe 2)) (height infinity)
                      (material (make dielectric (epsilon myEd))))
                    (make cylinder
                      (center 0  (* myRe -1)  0) (radius (/ myDe 2)) (height infinity)
                      (material (make dielectric (epsilon myEd))))
                    (make cylinder
                      (center 0  (* myRe 1)  0) (radius (/ myDe 2)) (height infinity)
                      (material (make dielectric (epsilon myEd))))

                       ))

(define shrunkenCluster (list
                    (make cylinder
                       (center (* myRs (/ (sqrt 3) 2)) (* myRs -0.5) 0) (radius (/ myDs 2)) (height infinity)
                       (material (make dielectric (epsilon myEd))))
                    (make cylinder
                      (center (* myRs (/ (sqrt 3) 2)) (* myRs 0.5)  0) (radius (/ myDs 2)) (height infinity)
                      (material (make dielectric (epsilon myEd))))
                    (make cylinder
                      (center (* myRs (/ (sqrt 3) -2)) (* myRs 0.5) 0) (radius (/ myDs 2)) (height infinity)
                      (material (make dielectric (epsilon myEd))))
                    (make cylinder
                      (center (* myRs (/ (sqrt 3) -2)) (* myRs -0.5)  0) (radius (/ myDs 2)) (height infinity)
                      (material (make dielectric (epsilon myEd))))
                    (make cylinder
                      (center 0  (* myRs -1)  0) (radius (/ myDs 2)) (height infinity)
                      (material (make dielectric (epsilon myEd))))
                    (make cylinder
                      (center 0  (* myRs 1)  0) (radius (/ myDs 2)) (height infinity)
                      (material (make dielectric (epsilon myEd))))

                       ))






(set! geometry (append (geometric-objects-duplicates (vector3 (/ (sqrt 3) 2) -0.5 0) -4 90 (geometric-objects-duplicates (vector3 (/ (sqrt 3) 2) 0.5 0) 0 90 extendedCluster)) (geometric-objects-duplicates (vector3 (/ (sqrt 3) 2) -0.5 0) -4 90 (geometric-objects-duplicates (vector3 (/ (sqrt 3) 2) 0.5 0) -90 -1 shrunkenCluster))))







(set! sources (list
               (make source
                 (src (make continuous-src (frequency 0.4)))
                 (component Ez)
                 (center -6 6))))

(set! pml-layers (list (make pml (thickness 1.0))))

(set! resolution 36)


(use-output-directory)
(run-until 100
           (at-beginning output-epsilon)
           (at-every 0.1 (output-png Ez "-m -1 -M 1 -Zc dkbluered")))
;(run-until 200
;          (at-beginning output-epsilon)
;        (at-end output-efield-z))
