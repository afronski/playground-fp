; When you are working with REPL, you don't have to define namespaces.
; However in files it is necessary to define namespace, like here:
(ns com.labrepl.afronski.name-and-places)

; You can load the code from any Clojure  library with it:
(require 'clojure.java.io)

; All loaded namespaces:
(all-ns)

; Making a reference to the name in the current namespace:
(refer 'clojure.java.io)

; If you want to load and refer in one step, call 'use':
(use 'clojure.java.io)

; Importing is like referring directly:
(java.io.File. "woozle")

(import java.io.File)
(File. "woozle")

; You can import multiple classes:
(import [java.util Date Random])
(Date. (.nextInt (Random.)))

; BTW. arrow macro reverses order of inside-out code:
(-> (Random.) (.nextInt) (Date.))