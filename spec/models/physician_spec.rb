require 'rails_helper'

RSpec.describe Physician, type: :model do
   let(:appointment) { FactoryBot.create(:appointment, physician: physician, patient: patient) }
   let(:physician) { FactoryBot.create(:physician) }
   let(:patient) { FactoryBot.create(:patient) }
  

   # for belongs_ to association
   it 'should be associated with each other' do
      expect(appointment.physician).to eq(physician)
      expect(appointment.patient).to eq(patient)
  end

 
 # for patient has_many physicians
  describe 'associations' do
    it 'has many physicians through appointments' do
      patient = create(:patient)
      physician1 = create(:physician)
      physician2 = create(:physician)

      appointment1 = create(:appointment, physician: physician1, patient: patient)
      appointment2 = create(:appointment, physician: physician2, patient: patient)
      

  
      expect(patient.physicians).to include(physician1, physician2)
      expect(appointment1.patient).to eq(patient)
      expect(appointment2.patient).to eq(patient)
    end
  end

# for physician has_ many patients
  describe 'associations' do
    it 'has many physicians through appointments' do
      physician = create(:physician)
      patient1 = create(:patient)
      patient2 = create(:patient)

      appointment1 = create(:appointment, physician: physician, patient: patient1)
      appointment2 = create(:appointment, physician: physician, patient: patient2)
      

  
      expect(physician.patients).to include(patient1, patient2)
      expect(appointment1.physician).to eq(physician)
      expect(appointment2.physician).to eq(physician)
    end
  end



end
