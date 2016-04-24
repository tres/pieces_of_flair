require 'spec_helper'

describe PiecesOfFlair::Flair do
  let!(:name) {'name'}
  let!(:art) {'art'}
  context :initializer do
    before :each do
      @flair = PiecesOfFlair::Flair.new(name: name, art: art)
    end
    it 'should populate attributes with passed named parameters' do
      expect(@flair.name).to eq(name)
      expect(@flair.art).to eq(art)
    end
  end

  context :class_methods do
    context :get_pieces do
      it 'should return an Array' do
        expect(PiecesOfFlair::Flair.get_pieces).to be_an_instance_of(Array)
      end

      it 'should return PiecesOfFlair::Flair objects in the array' do
        expect(PiecesOfFlair::Flair.get_pieces.first).to be_an_instance_of(PiecesOfFlair::Flair)
      end

      it 'should return an array with one element when called without an arg' do
        expect(PiecesOfFlair::Flair.get_pieces.count).to eq(1)
      end

      it 'should return an array with as many elements as defined in the arg' do
        num = rand(10)
        expect(PiecesOfFlair::Flair.get_pieces(num).count).to eq(num)
      end

    end
  end

end
