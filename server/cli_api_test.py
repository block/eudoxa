from server.agent.non_web_recommendation_api import NonWebRecommendationAPI


def main() -> None:
    with NonWebRecommendationAPI() as api:
        result = api.recommend_sync(
            "I want a medium-stiff snowboard for carving, but price matters."
        )

    print(result["recommended_product"])
    print(result["top_products"])  # up to 50 ranked boards


if __name__ == "__main__":
    main()
