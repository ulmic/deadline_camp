class Web::MembersController < Web::ApplicationController
  def index
    @members = Member.all
  end

  def new
    @member = MemberRegistrationType.new

    title t('registration')
  end

  def create
    @member = MemberRegistrationType.new(params[:member])

    if @member.save
      member_d = MemberDecorator.new(@member)
      #MemberMailer.welcome(member_d).deliver

      member_sign_in(@member)
      flash[:success] = flash_translate(:success).html_safe
      redirect_to :root
    else
      render action: :new
    end
  end

  def login
    @member = Member.new
    if member_signed_in?
      redirect_to member_path @member
    else
      @member = Member.find_by_email params[:email]
      if @member && @member.authenticate(params[:password])
        member_sign_in @member
        redirect_to :root
      else
        flash[:notice] = t 'wrong_login'
      end
    end
  end

  def logout
    member_sign_out
    redirect_to :root
  end

end
