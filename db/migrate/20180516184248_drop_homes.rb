class DropHomes < ActiveRecord::Migration[5.1]
  def change
    content = "<div>Democratic Socialists of America (DSA) is the country's largest socialist organization, and East Bay DSA is the fifth-largest chapter in the US. We are building progressive movements for social change in Oakland, Berkeley, and throughout the East Bay while establishing an openly democratic socialist presence in American communities and politics.<br><br></div><h1>Single-Payer Healthcare</h1><div>East Bay DSA is organizing block-by-block to build a mass movement in California. See how we're working for <a href=\"https://www.eastbaydsa.org/campaigns-healthcare\">single-payer healthcare</a>.<br><br></div><h1>Annual Convention</h1><div>The <a href=\"http://convention.eastbaydsa.org/\">annual East Bay DSA convention</a> is coming this April. Discover what you need to know about electing a new steering committee and collectively deciding on a priorities resolution that will guide our work in the upcoming year.<br><br></div><h1>Learn More</h1><div>Learn more <a href=\"https://www.eastbaydsa.org/about\">about East Bay DSA</a>, who we are, and what we do.<br><br></div><h1>Events</h1><div>See our <a href=\"https://www.eastbaydsa.org/events\">upcoming meetings and actions</a>.</div>"

    Page.create! title: 'We are the East Bay chapter of Democratic Socialists of America', content: content, slug: 'home'

    drop_table :homes
  end
end
