module ProductsHelper
	  def render_product_photo(photo, size = "thumb")

    if photo.present?
      avatar_url = photo.avatar.send(size).url
    else
      
     case size
      when :medium
         volume = "300x300"
      else
         volume = "200x200"
      end

      avatar_url = "http://placehold.it/#{volume}&text=No Pic"
    end

    image_tag(avatar_url, :class => "thumbnail")

  end

  def render_product_name(product)
    product.title
  end

  def render_product_desc(product)
    simple_format(product.description)
  end

  def render_product_quantity(product)
    product.quantity
  end

  def render_product_price(product)
    product.price
  end

end
