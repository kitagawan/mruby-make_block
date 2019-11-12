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

    def mini_create
        time=Time.now
        time=time.to_s
        str=time.to_s.split(//)
        #Bignumに変換
        data=str[11].to_i+str[12].to_i+str[17].to_i+str[18].to_i
        #Fixnumに変換
        data=data.to_fix
        @mini_block[@m_count]=Mini_Block.new(time,data)
        @m_count=@m_count+1
    end   
    
    def connect
        @address.genekey2
    end
end