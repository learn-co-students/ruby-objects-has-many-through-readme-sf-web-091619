class Waiter

    attr_accessor :name, :years

    @@all = []

    def initialize (name, years)
        @name = name
        @years = years
        @@all << self
    end

    def new_meal (customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select { |meal| meal.waiter == self }
    end

    def best_tipper
        best_tipped_meal = meals.max { |meal1, meal2|
            meal1.tip <=> meal2.tip
        }
        best_tipped_meal.customer
    end

    def self.all
       @@all 
    end
end