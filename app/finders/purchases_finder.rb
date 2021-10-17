# frozen_string_literal: true

class PurchasesFinder
  attr_reader :params, :resources

  def initialize(params:, resources:)
    @params = params
    @resources = resources
  end

  def call
    collections = resources
    collections = filter_by_category_id(collections)
    filter_by_avalible_courses(collections)
  end

  private

  def filter_by_category_id(collections)
    return collections if params[:category_id].blank?

    collections.merge(Course.where(category_id: params[:category_id]))
  end

  def filter_by_avalible_courses(collections)
    return collections unless params[:avaiabled]

    collections.where(Purchase.arel_table[:expired_at].gteq(Time.zone.now))
  end
end
