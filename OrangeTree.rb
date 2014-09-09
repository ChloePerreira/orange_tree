# Orange Tree

class OrangeGrove

        attr_accessor :population, :grove, :bounty

        def initialize
                @grove = []
                @bounty = 0
        end

        def grove_gen(population)
                population.times do 
                        @grove.push(OrangeTree.new) # do .new or else you just push the whole class
                end
                @grove
        end

        class OrangeTree
                attr_accessor :age, :orangeCount, :height, :alive

                def initialize
                        @height = 0 
                        @age = 0
                        @orangeCount = 0
                        @alive = true
                end

                def height
                        @height
                end

                def one_year_passes # die when age > 8
                        @age += 1
                        @height += 3
                        if @age > 8
                                @alive = false
                        end
                        @age
                end

                def fruit_gen # should go once per year, return orange count
                        if @age < 3
                                @orangeCount = 0
                        elsif @age <= 5
                                @orangeCount = 19
                        elsif @age <= 8
                                @orangeCount = 36
                        end
                        @orangeCount
                end

                def pick_orange # subtract orange, return orange count
                        @orangeCount -= 1
                        if @orangeCount >= 0
                                puts "Mmm...tasty!\nOranges left: #{@orangeCount}"
                        else
                                puts "Well, you can't! There are no oranges on this tree."
                                @orangeCount = 0 # set equal to 0 to prevent negative
                        end
                        @orangeCount
                end
        end
end


# main

def treeCycle(array)
        i = 1
        array.each do |element|
                element.one_year_passes
                element.fruit_gen
                if element.orangeCount != 0 
                        puts "Do you want to pick an orange off of tree #{i}? (yes or no)"
                        answer = gets.chomp
                        if answer == "yes"
                                element.pick_orange
                        end
                end
                i += 1
        end
end

def printTree(array)
        i=1
        array.each do |element|
                puts "-" * 21
                puts "Tree #{i}"
                if !element.alive 
                        puts "This tree is dead."
                else
                        puts "Age: #{element.age}"
                        puts "Height: #{element.height} feet"
                        puts "Oranges: #{element.orangeCount}"
                end
                i += 1
        end
end

def bountyCalc(array)
        bounty = 0
        array.each do |element|
                if element.alive 
                        bounty += element.orangeCount
                end
        end
        bounty
end

def allDead(array)
        array.each do |element|
                a = 1
                if element.alive
                        a = a*0
                end
                return a
        end
end

                        
mygrove = OrangeGrove.new
puts "How many trees are in your grove?"
n = gets.chomp
mygrove.grove_gen(n.to_i)
input = "empty"
while input != "exit"
        if (allDead(mygrove.grove)!=0)
                puts "Can't continue. All of your trees have died."
                exit
        end
        treeCycle(mygrove.grove)
        printTree(mygrove.grove)
        puts "Total oranges in grove: #{bountyCalc(mygrove.grove)}"
        puts "Press enter to continue. Type exit to stop."
        input = gets.chomp
end

#puts mygrove.grove[0].age - this is how you access a single element of your array
