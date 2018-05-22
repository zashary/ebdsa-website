class StaticController < ApplicationController
  # Currently the join page is the only hard-coded static page,
  # because we want a signup form to appear half-way down the page
  # (as opposed to the very bottom of the page). Once we re-design
  # the content, or build support for mid-page forms in the Page model,
  # we can remove this.
  def join
  end
end
