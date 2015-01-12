(ns student.dialect
	(:require [clojure.string :as str]))

(defn canadianize  [sentence] (str/replace sentence #"\.$" ", eh?"))