<<<<<<< HEAD
require '../rails_helper'
=======
require_relative '../rails_helper'
>>>>>>> 1910ae947c884c4182d1967a614f4676064006a9

RSpec.describe Tag, type: :model do
  it "has a name" do
    aTag = Tag.new
    aTag.name = 'myTag'
    expect(aTag.name).to eq('myTag')
  end
end
