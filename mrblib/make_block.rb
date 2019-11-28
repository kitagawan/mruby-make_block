class Make_block
    def initialize
        #初期ハッシュ値
        @new_hash="kdmehfb43ijsqwioxz49gn28ewplonfa"
        #小ブロック
        Mini_Block= Struct.new(:time,:data)
        #大ブロック(小ブロックが数個集まったブロック)
        Block= Struct.new(:prev_hash,:mini_block)
        @block=Array.new()
        @mini_block=Array.new()
        @count=0
        @m_count=0
        #アドレス生成クラス
        @address=Generate_Address.new
    end

    #小ブロック生成メソッド
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
    
    #大ブロックの生成メソッド
    def block_create
        str_array=Array.new
        mini_block=Array.new
        j=0
       #小ブロックの数だけパックする
        while @m_count>0 do
          @m_count-=1
          if @mini_block[@m_count].data.class==Fixnum
            #通常時(温度がint型で送られてくる)
            m_str=@mini_block[@m_count].to_a.pack("a* i*")
          else
            #交換時(データがサーバ側のハッシュ値で送られてくる)
            m_str=@mini_block[@m_count].to_a.pack("a* a*")
          j=1
          end
           #一時的に配列にパック内容をプッシュ
          str_array.push(m_str)
        end
        
        str_array.push(@new_hash) #前ブロックのハッシュ値をプッシュ
        
        if j==0
        puts "ブロック生成"
        else
        puts "通過ブロック生成"
        j=0
        end
        
        str=str_array.pack("a* a* a* a*") #圧縮
        mini_block=@mini_block.clone #コピーする
        @mini_block.clear #配列を初期化
        p @block[@count]=Block.new(@new_hash,mini_block)
        @new_hash=Digest::MD5.hexdigest(str)
        @count+=1
      end

     #通信時に送信する匿名アドレスの部分のメソッド(他のクラスを使えるかのテスト部分)
     #現段階では通信部分は未実装(このメソッドを内部で利用)
      def connect
        @address.genekey
      end
end