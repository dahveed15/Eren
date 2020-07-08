require "rails_helper"

RSpec.describe ExercisesController, type: :controller do
  describe "create" do
    # it "assigns @teams" do
    #   team = Team.create
    #   get :index
    #   expect(assigns(:teams)).to eq([team])
    # end
    #
    # it "renders the index template" do
    #   get :index
    #   expect(response).to render_template("index")
    # end

    describe "when the bodyweight param is truthy" do
      let(:user) { FactoryBot.create(:user) }

      before do
        sign_in(user)
      end

      let(:activity) { Activity.create!(name: 'pushups', user: user)}
      subject { post :create, params: { exercise: { reps: 5, sets: 3, bodyweight: true, weight_value: "", units: 'lbs' }, activity_id: activity.id } }


      it 'saves the exercise without the weight_value param' do
        expect { subject }.to change { Exercise.count }.by(1)
        expect(Exercise.last.units).to be_nil
      end
    end
  end
end
