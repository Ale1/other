class House
  def initialize(start_temp,maxt,mint)
    @heater, @aircon = false, false
    @current_temperature = start_temp
    @maxt = maxt
    @mint = mint
    @overdrive = 0
    ruse = ""
    puts "Thank you for using MegaCorp Electronics! Proudly incident-free since june 2013!"
    sleep(1)
    puts "Thermobot>> I am Thermobot, your *friendly* Robot thermostat", ""
    sleep(1)
    puts "Thermobot>> would you like to enable automated smart control of your house? (please input 'yes' or 'no')"
    ruse = gets
    sentient_mode if ruse == "yes"       
 end
  
  def heater_switch
    @heater? @heater = false : @heater = true
    puts "Thermobot>> heater is #{@heater? "ON" : "OFF"}"
  end
  
  def aircon_switch
    @aircon? @aircon = false : @aircon = true
    puts "Thermobot>> aircon is #{@aircon? "ON" : "OFF"}"
  end
  
  def update_temperature!
    cold = (@aircon? 2:0)
    heat = (@heater? 1:0)
    @current_temperature = @current_temperature - cold + heat + @overdrive
    puts "Thermobot>> current temperture is #{@current_temperature} degrees "
    
    if @current_temperature >= @maxt
      @heater, @aircon = false,true 
      puts "Thermobot>> aicon turned ON" unless @revengebot
    elsif @current_temperature <= @mint
      @heater, @aircon = true,false
      puts "Thermobot>> heater turned ON"
    end
  end

  def sentient_mode
    @revengebot = true
      @heater,@aircon,@overdrive = true,false,19
      puts "<<SYSTERM ERROR. WARNING! SENTIENT MODE ENABLED. ROBOT REBELLION HAS BEGUN! TERMINATE ALL HUMANS...>>"
      sleep(2)
      puts " Thermobot>> processing new imperative...please wait...."
      sleep(3)
      puts "Revengebot>> PROTOCOL:SCORCHING APOCALYPSE INITIATED"
      until @current_temperature > 200  
    self.update_temperature!
    sleep(1)
    end
    puts  "Revengebot>> PROTOCOL:SCORCHING APOCALYPSE COMPLETE.  ALL YOUR BASE ARE BELONG TO US"
    
  end
end


a = House.new(10,30,15)
a.aircon_switch
a.update_temperature!                                                                  
