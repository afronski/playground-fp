(ns address-book.core.routes.address-book-routes
  (:require [ring.util.response :as response]
            [compojure.core :refer :all]
            [address-book.core.views.address-book-layout :refer [common-layout
                                                                 read-contact
                                                                 add-contact-form]]))

(def contacts (atom [{:id 1 :name "Jarrod Taylor" :phone "(555) 666-7777" :email "jarrod@jarrodctaylor.com"}
                     {:id 2 :name "James Dalton" :phone "(123) 567-8901" :email "cooler@roadhouse.com"}
                     {:id 3 :name "Johnny Utah" :phone "(543) 333-1234" :email "j.utah@buckeyes.com"}]))

(defn next-id []
  (->>
   @contacts
   (map :id)
   (apply max)
   (+ 1)))

(defn post-route [request]
  (let [name (get-in request [:params :name])
        phone (get-in request [:params :phone])
        email (get-in request [:params :email])]
    (swap! contacts conj {:id (next-id) :name name :phone phone :email email})
    (response/redirect "/")))

(defn get-route [request]
  (common-layout
   (for [contact @contacts]
     (read-contact contact))
   (add-contact-form)))

(defroutes address-book-routes
  (GET  "/"     [] get-route)
  (POST "/post" [] post-route))
