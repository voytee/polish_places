class Province < ActiveRecord::Base
  attr_readonly :name, :code
  has_many :places
end
