describe('Nuance', function () {

  var nuance

  beforeEach(function () {
    nuance = new Nuance({
      openUrl: "https://blahchat.gov.uk"
    })
  })

  it('should create nuance class correctly', function () {
    expect(nuance.openUrl).toBe("https://blahchat.gov.uk")
    expect(nuance.API_STATES).toEqual([
      "BUSY",
      "UNAVAILABLE",
      "AVAILABLE",
      "ERROR",
      "ONLINE",
      "OFFLINE"
    ])
  })

  it('should return busy if agent is busy', function () {
    var result = {
      response: "BUSY"
    }

    expect(nuance.apiResponseSuccess(result).status).toBe("BUSY")
  })

  it('should return error if invalid state is given', function () {
    var result = {
      response: "THIS_IS_INVALID"
    }

    expect(nuance.apiResponseSuccess(result).status).toBe("ERROR")
  })

  it('should return error for when the API responds with an error', function () {
    expect(nuance.apiResponseError({}).status).toBe("ERROR")
  })
});
