class Make_block
    def initialize
        @new_hash="kdmehfb43ijsqwioxz49gn28ewplonfa"
        Mini_Block= Struct.new(:time,:data)
        Block= Struct.new(:prev_hash,:mini_block)
        @block=Array.new()
        @mini_block=Array.new()
        @count=0
        @m_count=0
        @address=Generate_Address.new
    end
    
    def connect
        @address.genekey2
    end
end