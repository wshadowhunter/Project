class Product < ActiveRecord::Base

  has_many :votes

     validates :title, :description,:presence => true
    # validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
     validates :title, :uniqueness => true
    # validates :image_url, :format => {
     #    :with => %r{\.(gif|jpg|png)$}i,
     #    :message => 'must be a URL for GIF, JPG or PNG image.'
#}

   def self.search(col_type,col_name)
       if col_type == "name"
           Product.find(:all, :conditions => ['Name LIKE ?', "%#{col_name}%"])
       elsif col_type == "description"
           Product.find(:all, :conditions => ['description LIKE ?', "%#{col_name}%"])
       elsif  col_type == "name" &&  col_type == "description"
           Product.find(:all, :conditions => ['description LIKE ?', "%#{col_name}% and ",'Name LIKE ?', "%#{col_name}%" ])
       end
    end
end
