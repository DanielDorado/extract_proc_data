class Calculator

    @state = :in # :in, :out, :first_in_and_mem
    @has_memory = false

    @formats = []
    @values = []
    @mem_values = []

    def initialize(formats)
        @formats = formats
        raise "The first format item must be :t" if ( @formats[0] != :t)

        if ( @formats & [:d] ).size == 0
            @has_memory = false
            @state = :in
        else
            @has_memory = true

            @state = :first_in
        end
    end

    def in(values)
        case @state
        when :out
            raise "Now is not time to a in. Is out time."
        when :in
            @state = :out
            if @has_memory
                @mem_values = @values
            end
            @values = values
        when :first_in
            @state = :in
            @values = values
        end
    end
    
    def out()
        values = []
        case @state
        when :in
            raise "The program is waiting to in."
        when :first_in
            raise "The program is waiting to second in."
        end
        values = @values.dup
        @formats.each_with_index { |f, i|
            if @has_memory
                case f
                when :d
                    values[i] -= @mem_values[i]
                when :v
                    values[i] =  (values[i] - @mem_values[i]) / (values[0] - @mem_values[0])
                end
            end                
            if (values[i].is_a? (Float))
                values[i] = "%.2f".%(values[i]).to_f
            end
        }
        @state = :in
        values
    end
    
end
