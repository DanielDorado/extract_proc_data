class Parser
    
    def initialize(conversors)
        @conversors = conversors
        
    end
    
    def parse(line)
        words = line.split()
        if @conversors.size != words.size
            error("Mistmatch elements. Conversors: #{@conversors.size}, Words: #{@words.size}")
        end
        
        result = []
        
        @conversors.each_with_index{ |c, i|
            case c 
            when :s
                result.push words[i]
            when :i
                result.push words[i].to_i
            when :f
                result.push words[i].to_f
            end
        }
        result
    end
    
end
