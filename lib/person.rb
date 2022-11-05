require 'pry'
# your code goes here
class Person
    attr_accessor :bank_account
    attr_reader :name, :happiness, :hygiene
    attr_writer 
    
    def initialize name
        @name = name
        @bank_account = 25
        @happiness = 8
        @hygiene = 8
    end

    def happiness= value
        @happiness = value.clamp( 0, 10)
    end
    

    # I became stuck on the hygiene BECAUSE I TOOK IT OFF ACCESSOR AND FORGOT TO REMOVE A COMMA! Syntax Errors for days. Then I forgot to place a '=' after hygiene on my setter. This is what enables us to change the data/value later if we wanted to.
    def hygiene= value
        @hygiene = value.clamp(0, 10)
    end

    def happy?
        @happiness >7 ? true : false
    end

    def clean?
        @hygiene >7 ? true : false
    end
    #I'mm forgetting how to write the syntax of true false with the ? at the end of the message. Like self.(method?) I even tried finding other methods, but self didnt seem to identify. Ohhh. Because it's just an attribute and not an instance. Duh.  Princeton used a ternary instead.

    def get_paid amount 
        @get_paid= amount
        @bank_account += amount 
        "all about the benjamins"
        #I was missing the bottom because I did @bank_amount = amount += 1 which wont work but why not? My thinking is we're setting the new value of bank_account equal to the amount as it is incremented. Ohhhh! Because I chose the 1. Instead of letting the test put in whatever it wanted. DUH! No biggie homie.
    end

    def take_bath 
        self.hygiene += 4
        # @hygiene += 4 this doesnt work as it makes the hygiene level go above 10.  expected: 10 got: 13. Now we use self Trey, Princeton's explanation: We're saying self is our instance, but the test is actually passing an instance of penelope, so we can use this now as opposed to before. So you were right earlier as there was no specific instance being called. This is like state, where we have to have a setter method i.e. #hygiene. **Pay attention to the errors, you saw penelope.hygiene was being passed but ignored it. That's bad.
        '♪ Rub-a-dub just relaxing in the tub ♫'
    end

    def work_out
        self.hygiene -= 3
        self.happiness += 2
        '♪ another one bites the dust ♫'
    end

    def call_friend person
        #Where I was stuck next.  Person non-attribute instance methods #call_friend makes the friend happier by three points
        #  Failure/Error: expect(felix.happiness).to eq(8)
        #
        #  expected: 8
        #   got: 5
        # ?????? (Highlight ?????)What I tried: Adding 3 points of happiness to the new person instance: @person = Person.new("Felix", happiness + 3). Because it follows the parameters pattern, name then happiness. But this breaks my code. So I'm missing something. Could it be felix.happiness += 3? NOPE. Confuses our self method. Which is fair because the self is applying to Penelope here. Binding.pry made person.happiness + 3 work specifically for Felix.. Hmm what's going on? Felix has an initial happiness value of 8, which makes sense. So maybe I shouldn't have created a new person: @person = Person.new("Felix")?? Let's see what Princeton does, as the error states expected 8 got 5..?? Wow. I misunderstood the accepts one argument an instance of the Person Class. Princeton used: call_friend friend. It works. I need to stop creating instances and assuming they want more than what they asked for. Because it makes sense that me creating a new person gave them an initial value of 8 while just passing an argument gave the friend their own values from the test. WAIT A MINUTE! Princeton's "friend" parameter in pry also gives 8 happiness as an initial value..? Now I dont feel bad for doing it my way. WTF! We DID THE SAME ANSWER!?! No Trey. You did person.happiness + 3 which wouldn't set the new value after the addition. DUH! Give yourself more credit, before entirely throwing out an idea. BUT your intial way by creating an instance ??????? was a hardcoded approach since we may not know all of their names. I was confused as to how it would automatically create a new instance for us. But Ig the test just does that?..
        self.happiness += 3
        person.happiness += 3
        "Hi #{person.name}! It's #{self.name}. How are you?"

        #?????? Princeton, can you explain what "Person non-attribute instance methods" mean? Is non-attribute redudant to instance methods? Because we still have our instance grabbing attributes throught this method. Or am I incorrect?

    end
    
    def start_conversation friend, topic
        if topic == "politics" 
            self.happiness -=2 
            friend.happiness -=2 
        "blah blah partisan blah lobbyist"

        elsif topic == 'weather'
            self.happiness += 1
            friend.happiness += 1

            "blah blah sun blah rain"
        else topic == "other"
            'blah blah blah blah blah'

        end
        #?????? I got stuck next creating the conditional that subtracts points if talking about politics. my code: if topic == politics then friend.happines -= 2 && self.happiness -= 2 end breaks the test. I dont believe a ternary to be our best option. I think a case is too macro for our options. So if then statement seems like the most practical in our situation. Dang it I dont want to give up right now. I feel like im so close, but I'm misunderstanding somme syntax here. ?????? I have then tried if topic == "politics" friend.happiness -=2 && self.happiness -=2 this makes pry return pry(#<Person>)* instead pry(#<Person>)>. What does that * mean other then I broke it? WTF! Why did your work and mine not? We had the same idea but yours are in different lines? Does that truly make the difference in Ruby?? It does. Also we shouldn't use the && here..? Implicit returns I suppose?? Princeton?

        # ???? For the weather why can I not use happiness += 1 for an implicit return of the #happiness to self? Also why can we not set topic == topic as the parameter should change with each test? Is that too much for ruby because of the local scope of the if statement?

        # binding.pry



    end
    

end




#When would we want to type out the reader as opposed to attr_reader?
#Don't forget to make your declaration in pry Trey. I.E. "person = Person.new("Trey") This is what allows you to access the other attributes now assigned to Trey.
