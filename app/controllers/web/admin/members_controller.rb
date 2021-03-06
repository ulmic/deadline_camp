class Web::Admin::MembersController < Web::Admin::ApplicationController
  def show
    @member = Member.find params[:id]
  end

  def index
    @search = Member.active.metasearch( search_params(params[:search]) )
    @members = @search.page(params[:page])
  end

  def edit
    @member = MemberType.find(params[:id])
  end

  def update
    @member = MemberType.find(params[:id])

    if @member.update_attributes(params[:member])
      flash[:success] = flash_translate(:success)
      redirect_to admin_member_path @member
    else
      render action: :edit
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.bust
    redirect_to action: :index
  end

  private
    def search_params(prms)
      prms ||= {}
      {"meta_sort"=>"id.desc"}.merge(prms)
    end
end
