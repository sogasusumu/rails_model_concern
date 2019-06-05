bundle:
	bundle install --path vendor/bundle

link:
	cd spec/dummy && ln -s ../../spec

rspec_i:
	spec/dummy/bin/rails generate rspec:install

rm_dummy_spec:
	rm spec/dummy/spec

init:
	bundle
	link
	rspec_i
	rm_dummy_spec

lint:
	bundle exec rubocop ./lib -c .rubocop.yml -R -a

test:
	bundle exec rspec

g:
	spec/dummy/bin/rails g rails_model_concern controller_name#index-model_one

d:
	spec/dummy/bin/rails d rails_model_concern controller_name#index-model_one

pre_commit:
	lint
	test

console:
	spec/dummy/bin/rails c
