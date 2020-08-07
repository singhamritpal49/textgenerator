require 'tty-prompt'

class CommandLineInterface

    def initialize
        @prompt = TTY::Prompt.new
    end

    def formWords(str)
        # regular expression for removing all the punctuation
        str.gsub!(/[!@.;,'%&"]/,'')
        sentence = str.split(" ")
        result = []
        101.times do |i|
          if i > 0 and i % 10 == 0
            result[result.length - 1] += "."
          end
          word = sentence[rand(sentence.length)]
          if i < 100 && i % 10 == 0
            capital = word[0].upcase
            suffix = word.slice(1..(word.length - 1))
            result.push(capital + suffix)
          else
            result.push(word.downcase)
          end
        end
        result.pop()
        result.join(" ")
      end
      
      def hello 
        words = @prompt.ask("Please Enter the Words:")
        if(!words) 
           return puts "Notice: this field cannot be empty, please try again!"
        end
        puts "Generating 100 Words Paragraph"
        puts "Please Wait Loading..."
        sleep(2)

        puts formWords(words)
    end


end

cli = CommandLineInterface.new

cli.hello


