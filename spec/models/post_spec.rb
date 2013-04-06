require 'spec_helper'

describe Post do
	before { subject.title = "Test"; subject.content = "Content" }
	it { should validate_presence_of(:title) }

	describe "state_machine" do
		describe "states" do 
			describe ':unsuitable_to_publication' do
				it 'should be an initial state' do
					subject.unsuitable_to_publication?.should be_true
				end
			end

			describe ":published" do
				before { subject.publicate }
				it { should validate_presence_of(:content) }
			end

			describe ":ready_to_publication" do
				before { subject.unpublicate }
				it { should validate_presence_of(:content) }
			end

			describe "events" do 
				it 'should change to :published on :publicate' do
					subject.publicate
					subject.published?.should be_true
				end

				it 'should change to :ready_to_publication on :unpublicate' do
					subject.unpublicate
					subject.ready_to_publication?.should be_true
				end
			end
		end


	end
end
