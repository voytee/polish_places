class Place < ActiveRecord::Base

  GENDERS = {
    '00' =>'część miejscowości',
    '15' =>'folwark',
    '30' =>'zakład hodowli zarodowej',
    '01' =>'wieś',
    '16' =>'schronisko turystyczne',
    '31' =>'stacja hodowli roślin',
    '02' =>'kolonia',
    '17' =>'klasztor',
    '32' =>'szkoła',
    '03' =>'przysiółek',
    '18' =>'tartak',
    '33' =>'ośrodek szkolny',
    '04' =>'osada',
    '19' =>'cegielnia',
    '34' =>'zakład wychowawczy',
    '05' =>'osada leśna',
    '20' =>'elektrownia',
    '35' =>'zakład leczniczy',
    '06' =>'osiedle',
    '21' =>'rybakówka',
    '36' =>'sanatorium',
    '07' =>'stacja PKP',
    '22' =>'bosmanat',
    '37' =>'uzdrowisko',
    '08' =>'nadleśnictwo',
    '23' =>'strażniczówka',
    '38' =>'ośrodek wypoczynkowy',
    '09' =>'leśniczówka',
    '24' =>'młyn',
    '39' =>'letnisko',
    '10' =>'gajówka',
    '25' =>'śluza',
    '11' =>'grupa domów',
    '26' =>'zakład doświadczalny',
    '95' =>'dzielnica',
    '12' =>'wybudowanie',
    '27' =>'PAN',
    '96' =>'miasto',
    '13' =>'majątek',
    '28' =>'instytut',
    '98' =>'delegatura',
    '14' =>'parcela',
    '29' =>'stacja oceny odmian',
    '99' =>'część miasta'
  }.freeze
  
  attr_readonly :name, :province_id, :gender_code
  
  belongs_to :province
  
  default_scope :order =>"name"
  
  named_scope :all_genders
  named_scope :cities, :conditions =>{ :gender_code => '96' }
  named_scope :villages, :conditions =>["gender_code in(?)",['01','02','04','11']]
  named_scope :cities_and_villages, :conditions =>["gender_code in(?)",['96','01','02','04','11']]
  named_scope :by_gender_code, lambda{ |code| { :conditions => { :gender_code => code }}}
  named_scope :by_gender, lambda{ |gender| { :conditions => { :gender_code => GENDERS.invert[gender]  }}}
  
  def gender
    GENDERS[self.gender_code]
  end
  
end
