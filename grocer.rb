
require 'pry'

def consolidate_cart(cart)
  final_hash = {}
  
  cart.each { |ele_hash|
    ele_name = ele_hash.keys[0]
    ele_stats = ele_hash.values[0]

    if final_hash.has_key?(ele_name)
      ele_stats[:count] += 1
    else
      final_hash[ele_name] = ele_stats
      final_hash[ele_name][:count] = 1
    end
  }

  return final_hash
end

def apply_coupons(cart, coupons)
  coupons.each { |coupon|
    item = coupon[:item]
    
    if cart[item] 
      if cart[item][:count] >= coupon[:num] && !cart.has_key?("#{item} W/COUPON")
        cart["#{item} W/COUPON"] = {price: coupon[:cost] / coupon[:num], clearance: cart[item][:clearance], count: coupon[:num]}
        cart[item][:count] -= coupon[:num]
      elsif cart[item][:count] >= coupon[:num] && cart.has_key?("#{item} W/COUPON")
        cart["#{item} W/COUPON"][:count] += coupon[:num]
        cart[item][:count] -= coupon[:num]
      end
    end
  }
  return cart 
end

def apply_clearance(cart)

  cart.map { |ele_hash|
    binding.pry
    


  }
  
  cart
end  
  
