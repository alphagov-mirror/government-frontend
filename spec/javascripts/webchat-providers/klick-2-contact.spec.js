describe('Klick2Contact', function () {

  beforeEach(function () {
    var klick2contact = new Klick2Contact();
  })

  it('should create Klick2Contact class correctly', function () {
    expect(klick2contact.k2c_baseLoad).toBe(0)
    expect(klick2contact.k2c_provider).toBe("HMP02")
    expect(klick2contact.k2c_url).toBe('https://hmpowebchat.klick2contact.com/v03')
  })

  it('should return busy if agent is busy', function () {
    var result = {
      "DPT": {
        "712": {
          "DPT_AGENTS": 1,
          "DPT_AGENTS_WITHLIMIT": 10
        }
      }
    }

    result = "k2c_doServiceStatus('" + JSON.stringify(result) + "');";

    expect(klick2contact.apiResponseSuccess(result).status).toBe("BUSY")
  })

  it('should return available if agent is available', function () {
    var result = {
      "DPT": {
        "712": {
          "DPT_AGENTS": 1,
          "DPT_AGENTS_WITHLIMIT": 0
        }
      }
    }

    result = "k2c_doServiceStatus('" + JSON.stringify(result) + "');";

    expect(klick2contact.apiResponseSuccess(result).status).toBe("AVAILABLE")
  })

  it('should return unavailable if agent is unavailable', function () {
    var result = {
      "DPT": {
        "712": {
          "DPT_AGENTS": 0,
          "DPT_AGENTS_WITHLIMIT": 0
        }
      }
    }

    result = "k2c_doServiceStatus('" + JSON.stringify(result) + "');";

    expect(klick2contact.apiResponseSuccess(result).status).toBe("UNAVAILABLE")
  })

  it('should return error if invalid state is given', function () {
    var result = {
      response: "THIS_IS_INVALID"
    }

    expect(klick2contact.apiResponseSuccess(result).status).toBe("UNAVAILABLE")
  })

  it('should return error for when the API responds with an error', function () {
    expect(klick2contact.apiResponseError({}).status).toBe("UNAVAILABLE")
  })

  it('should return a valid open url', function() {
    expect(klick2contact.openUrl()).toBe(/^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$/)
  })
}
