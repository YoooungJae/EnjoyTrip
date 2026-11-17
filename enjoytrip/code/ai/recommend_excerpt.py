# 출처: EnjoyTrip 중간발표 자료 "07 진행상황_이영재" 슬라이드(seq2seq 모델, 추천 알고리즘 연구)에서 옮긴 코드입니다.
# 슬라이드에 보이는 부분만 옮겼고, 마지막 분기 이후와 Seq2Seq 학습 코드는 남아 있지 않습니다.
# 역할: 지역과 테마 조건으로 관광지 후보를 고르고, Seq2Seq 모델이 방문 순서를 만들 입력 일정을 구성합니다.
import random

# tourist_attractions_data: 관광지 데이터 (컬럼: '지역', '테마', '관광지 이름')


def select_tourist_attractions(region, theme, num_attractions):
    """지역과 테마가 모두 맞는 관광지 중에서 num_attractions개를 무작위로 고른다."""
    attractions = tourist_attractions_data[
        (tourist_attractions_data['지역'] == region) & (tourist_attractions_data['테마'] == theme)
    ]['관광지 이름']
    selected_attractions = attractions.sample(min(num_attractions, len(attractions))).unique().tolist()
    return selected_attractions


def select_theme_for_region(region):
    available_themes = tourist_attractions_data[tourist_attractions_data['지역'] == region]['테마'].unique().tolist()
    return random.choice(available_themes) if available_themes else None


def generate_plausible_schedule(model, tokenizer, region=None, theme=None):
    min_length = 6   # Minimum number of attractions
    max_length = 10  # Maximum number of attractions
    num_attractions = random.randint(min_length, max_length)

    # Randomly select a theme if not provided
    if theme is None:
        if region:
            theme = select_theme_for_region(region)
        else:
            theme = tourist_attractions_data['테마'].sample().iloc[0]

    # Randomly select tourist attractions based on region and theme
    if region and theme:
        selected_attractions = select_tourist_attractions(region, theme, num_attractions)
    elif region:
        available_themes = tourist_attractions_data[tourist_attractions_data['지역'] == region]['테마'].unique().tolist()
        theme = random.choice(available_themes) if available_themes else None
        selected_attractions = select_tourist_attractions(region, theme, num_attractions)
    elif theme:
        ...  # 슬라이드는 여기서 잘려 있습니다.
