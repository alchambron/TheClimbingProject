class Cart
  attr_accessor :courses_ids

  def self.get(session_cart)
    cart = Cart.new

    cart.courses_ids = session_cart['courses_ids'] if !session_cart.nil? && !session_cart['courses_ids'].nil?
    return cart
  end

  def initialize
    @courses_ids = []
  end

  # Récupère depuis la base tous les courses correspondants à ceux ajoutés au panier
  def courses
    return Course.find(@courses_ids)
  end

  # Ajoute l'course au panier
  def add_course(course_id)
    return if course_id.nil?

    @courses_ids << course_id
  end

  # Supprime l'course du panier
  def delete_course(course_id)
    return if course_id.nil?

    @courses_ids = @courses_ids.reject { |i| i == course_id }
  end

  def total_price
    courses.map { |i| i.price }
           .reduce(:+)
  end

  def courses_count
    return courses.length
  end

  def make_empty
    @courses_ids = []
  end
end
