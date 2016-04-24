module PiecesOfFlair
  class Flair
    require 'sqlite3'

    # @!attribute name
    #  a general name representing the category of the art
    #
    # @return [String]
    attr_accessor :name

    # @!attribute art
    # the ascii art
    #
    # @return [String]
    attr_accessor :art


    def initialize(*args)
      params = args[0]
      params.each do |attr, value|
        self.public_send("#{attr}=", value)
      end if params
    end

    # get ascii art objects
    # @param [Integer] number of items to get
    #
    # @return [Array] containing [PiecesOfFlair::Flair] objects
    def self.get_pieces(num=1)
      db = SQLite3::Database.open(db_file_path)
      results = db.execute("SELECT * FROM ascii ORDER BY RANDOM() LIMIT #{num}");
      ret = []
      return ret if results.nil?
      results.each do |r|
        ret << PiecesOfFlair::Flair.new(name: r[1], art: r[0])
      end
      ret
    end

    protected
    def self.db_file_path
      path = File.join(File.dirname(__FILE__), '..', '..', 'db', 'pieces_of_flair.db')
      path
    end


  end
end
