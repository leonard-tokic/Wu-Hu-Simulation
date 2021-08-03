(define myRs (/ 3.16))
(define myRe (/ 2.78))
(define myDs (/ (* 2 myRs) 3))
(define myDe (/ (* 2 myRe) 3))
(define myEs 9.5)
(define myEe 8)

(set! geometry-lattice (make lattice (size 20 20 no-size)))



(define extendedCluster (list
                       (make block
                          (center (* myRe (/ (sqrt 3) 2)) (* myRe -0.5) 0) (e1 (/ (sqrt 3) 2) -0.5 0) (e2 (/ (sqrt 3) 2) 0.5 0) (e3 0 0 1) (size myDe myDe infinity)
                          (material (make dielectric (epsilon myEe))))
                       (make block
                         (center (* myRe (/ (sqrt 3) 2)) (* myRe 0.5)  0) (e1 (/ (sqrt 3) 2) -0.5 0) (e2 (/ (sqrt 3) 2) 0.5 0) (e3 0 0 1) (size myDe myDe infinity)
                         (material (make dielectric (epsilon myEe))))
                       (make block
                         (center (* myRe (/ (sqrt 3) -2)) (* myRe 0.5) 0) (e1 (/ (sqrt 3) 2) -0.5 0) (e2 (/ (sqrt 3) 2) 0.5 0) (e3 0 0 1) (size myDe myDe infinity)
                         (material (make dielectric (epsilon myEe))))
                       (make block
                         (center (* myRe (/ (sqrt 3) -2)) (* myRe -0.5) 0) (e1 (/ (sqrt 3) 2) -0.5 0) (e2 (/ (sqrt 3) 2) 0.5 0) (e3 0 0 1) (size myDe myDe infinity)
                         (material (make dielectric (epsilon myEe))))
                       (make block
                         (center 0  (* myRe -1)  0) (e1 (/ (sqrt 3) 2) -0.5 0) (e2 (/ (sqrt 3) 2) 0.5 0) (e3 0 0 1) (size myDe myDe infinity)
                         (material (make dielectric (epsilon myEe))))
                       (make block
                         (center 0  (* myRe 1)  0) (e1 (/ (sqrt 3) 2) -0.5 0) (e2 (/ (sqrt 3) 2) 0.5 0) (e3 0 0 1) (size myDe myDe infinity)
                         (material (make dielectric (epsilon myEe))))

                                              ))

                                              (define shrunkenCluster (list
                                                                     (make block
                                                                        (center (* myRs (/ (sqrt 3) 2)) (* myRs -0.5) 0) (e1 (/ (sqrt 3) 2) -0.5 0) (e2 (/ (sqrt 3) 2) 0.5 0) (e3 0 0 1) (size myDs myDs infinity)
                                                                        (material (make dielectric (epsilon myEs))))
                                                                     (make block
                                                                       (center (* myRs (/ (sqrt 3) 2)) (* myRs 0.5)  0) (e1 (/ (sqrt 3) 2) -0.5 0) (e2 (/ (sqrt 3) 2) 0.5 0) (e3 0 0 1) (size myDs myDs infinity)
                                                                       (material (make dielectric (epsilon myEs))))
                                                                     (make block
                                                                       (center (* myRs (/ (sqrt 3) -2)) (* myRs 0.5) 0) (e1 (/ (sqrt 3) 2) -0.5 0) (e2 (/ (sqrt 3) 2) 0.5 0) (e3 0 0 1) (size myDs myDs infinity)
                                                                       (material (make dielectric (epsilon myEs))))
                                                                     (make block
                                                                       (center (* myRs (/ (sqrt 3) -2)) (* myRs -0.5) 0) (e1 (/ (sqrt 3) 2) -0.5 0) (e2 (/ (sqrt 3) 2) 0.5 0) (e3 0 0 1) (size myDs myDs infinity)
                                                                       (material (make dielectric (epsilon myEs))))
                                                                     (make block
                                                                       (center 0  (* myRs -1)  0) (e1 (/ (sqrt 3) 2) -0.5 0) (e2 (/ (sqrt 3) 2) 0.5 0) (e3 0 0 1) (size myDs myDs infinity)
                                                                       (material (make dielectric (epsilon myEs))))
                                                                     (make block
                                                                       (center 0  (* myRs 1)  0) (e1 (/ (sqrt 3) 2) -0.5 0) (e2 (/ (sqrt 3) 2) 0.5 0) (e3 0 0 1) (size myDs myDs infinity)
                                                                       (material (make dielectric (epsilon myEs))))

                                                                                            ))





(set! geometry (append (geometric-objects-duplicates (vector3 (/ (sqrt 3) 2) -0.5 0) -4 90 (geometric-objects-duplicates (vector3 (/ (sqrt 3) 2) 0.5 0) 0 90 shrunkenCluster)) (geometric-objects-duplicates (vector3 (/ (sqrt 3) 2) -0.5 0) -4 90 (geometric-objects-duplicates (vector3 (/ (sqrt 3) 2) 0.5 0) -90 -1 extendedCluster))))







(set! sources (list
               (make source
                 (src (make continuous-src (frequency 0.4))) ;I used 0.4 for the below and 0.5355 for the in gap simulation
                 (component Ez)
                 (center -6 6))))

(set! pml-layers (list (make pml (thickness 1.0))))

(set! resolution 36)


(use-output-directory)
;(run-until 2 (at-beginning output-epsilon))
(run-until 100
           (at-beginning output-epsilon)
         (at-every 0.1 (output-png Ez "-m -1 -M 1 -Zc dkbluered")))
;(run-until 200
;          (at-beginning output-epsilon)
;        (at-end output-efield-z))
