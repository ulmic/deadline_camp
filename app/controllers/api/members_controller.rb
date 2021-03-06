class Api::MembersController < Api::ApplicationController
  respond_to :xls

  def index
    members = MemberDecorator.decorate Member.active
    members_collection = MemberCollectionConvertor.new(members, params[:options])
    respond_with members_collection
  end

  def show
    member = MemberDecorator.find(params[:id])
    respond_with member
  end

end
