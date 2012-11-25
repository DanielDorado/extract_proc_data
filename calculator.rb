class Calculator

    @state = :in # :in, :out, :first_in_and_mem
    @has_memory = false

    @formats = []
    @values = []
    @mem_values = []

    def initialize(formats)
        @formats = formats
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
            puts("Now is not time to a in. Is out time.")
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
            puts("The program is waiting to in.")
        when :first_in
            puts("The program is waiting to second in.")
            #when :out
        end
        values = @values.dup
        if @has_memory
            @formats.each_with_index { |f, i|
                case f
                when :d
                    values[i] -= @mem_values[i]
                end
            }
        end
        @state = :in
        return values
    end
    
end
