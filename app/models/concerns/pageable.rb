# rubocop:disable Style/ClassVars
module Pageable
  @@current_element = 0

  def current_element_id() = @@current_element || 0

  def next_element_id() = @@current_element += 1
end
# rubocop:enable Style/ClassVars
