# method that takes a number and returns how you would say it in English


  def in_words(num)

    @dictionary = {0=>'zero',1=>'one',2=>'two',3=>'three',4=>'four',5=>'five',
      6=>'six',7=>'seven',8=>'eight',9=>'nine', 10=>'ten', 11=>'eleven',
      12=>'twelve', 13=>'thirteen', 14=>'fourteen', 15=>'fifteen', 16=>'sixteen',
      17=>'seventeen', 18=>'eighteen', 19=>'nineteen', 20=>'twenty', 30=>'thirty',
      40=>'forty', 50=>'fifty', 60=>'sixty', 70=>'seventy', 80=> 'eighty', 90 => 'ninety'}
    
    @dictionary2 = {3=>'thousand', 6=>'million', 9=>'billion', 12=>'trillion'}
      
      def tens(num)
        if num <= 20      
          return @dictionary[num]
        elsif num< 100
          answer = ""
          answer += @dictionary[(num/10)*10]
          if num%10!=0
            answer += " #{@dictionary[num%10]}"
          end  
          return answer   
        end
      end
       
      def hundred(num)
        answer = ""
        if num >= 100
          answer +=  "#{@dictionary[num/100]} hundred"
        end
        if (num%100)!=0
          answer += " #{tens(num%100)}"
        end
        return answer
      end

      def sorter(num)
        # eliminates leading zeros => 002 => 2
        num = num.to_i

        if num < 1000
            return hundred(num)
        end

        left = num.to_s.length % 3
          
        if left == 0
            left_amount = num.to_s[0...3].to_i
            right_amount = num.to_s[3..-1]
        else        
            left_amount = num.to_s[0...left].to_i
            right_amount = num.to_s[left..-1]
        end

        thousand = @dictionary2[right_amount.length]   
        a = "#{hundred(left_amount)} #{thousand} #{sorter(right_amount)}"
        
      end

    return 'zero' if num == 0
    sorter(num)
  end
