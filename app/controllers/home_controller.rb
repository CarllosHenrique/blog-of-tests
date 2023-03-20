class HomeController < ApplicationController
  def index
    @registred_peoples = Person.all.limit 2
    @big_person = Person.where('age > 5').first
  end
end
