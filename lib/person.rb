require "pry"

class Person

    attr_reader :name, :happiness
    attr_accessor :bank_account, :hygiene

    def initialize(name, bank_account=25)
        @name = name
        # @bank_account = 25     # another way to do this is passing in above with initial assignment($25) and setting @x  = x
        @bank_account = bank_account
        @happiness = 8   # happiness here is done the orignal way bank_account was done
        @hygiene = 8
    end 

    def happiness=(value)
        # if value <= 10 and value >= 0             # x
        #     @happiness = value                    # this does not pass
        # end                                       # x

        # @happiness = value.clamp(0, 10)           # pass!

        @happiness = value
        @happiness = 10 if @happiness > 10
        @happiness = 0 if @happiness < 0
    end

    def hygiene=(value)
        @hygiene = value.clamp(0, 10)
        # uh oh! take_bath increases hygiene to over 10. We want to say something like: person takes a bath, then add 4, but do not go over 10
        # see self in take_bath
    end

    def happy?
    #     if happiness > 7 then true    #this works, but ternary is cleaner
    #         else false
    #     end
    # end
        happiness > 7 ? true : false # don't necessarily need @happiness
    end

    # def clean?               #used this first because test only required true return, following test required false return, so switched to ternary
    #     if hygiene > 7        
    #         true              # check the README.md, dummy. 
    #     end
    # end

    
    def clean?
        hygiene > 7 ? true : false
    end

    def get_paid(amount)  # need the @ symbol here, likely because we are passing something in
        @bank_account += amount
        return "all about the benjamins"
    end

    def take_bath
        self.hygiene += 4
        return "♪ Rub-a-dub just relaxing in the tub ♫"
    end

    def work_out
        self.hygiene -= 3
        self.happiness += 2
        return "♪ another one bites the dust ♫"
    end

    def call_friend(friend)
        self.happiness += 3
        friend.happiness +=3
        return "Hi #{friend.name}! It's #{name}. How are you?"
    end

    def start_conversation (person, topic)
        if topic == "politics"
            self.happiness -= 2
            person.happiness -= 2
            return 'blah blah partisan blah lobbyist'
        elsif topic == "weather"
            self.happiness += 1
            person.happiness += 1
            return "blah blah sun blah rain"        
        elsif topic != "politics" && "weather"
            return "blah blah blah blah blah"
        end
    end


# class end below
end

# binding.pry