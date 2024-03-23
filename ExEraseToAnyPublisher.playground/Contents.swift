import Combine
import Foundation

struct Todo: Codable {
    // Todo 모델의 정의
}

// URL을 생성합니다.
let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!

// URLSession을 사용하여 데이터를 가져오는 함수를 정의합니다.
func fetchDataFromURL(url: URL) -> AnyPublisher<Data, Error> {
    // URLSession 데이터 태스크를 생성합니다.
    let task = URLSession.shared.dataTaskPublisher(for: url)
    
    // 데이터 태스크를 실행하고 데이터를 방출하는 Publisher로 변환합니다.
    return task
        .mapError { error in
            error as Error // URLError를 Error로 변환
        }
        .map(\.data) // 데이터만 추출합니다.
        .eraseToAnyPublisher() // AnyPublisher로 변환합니다.
}

// 데이터를 가져오고 처리하는 파이프라인을 설정합니다.
let cancellable = fetchDataFromURL(url: url)
    .decode(type: Todo.self, decoder: JSONDecoder()) // 데이터를 디코딩합니다.
    .receive(on: DispatchQueue.main) // 결과를 메인 스레드로 전달합니다.
    .sink(
        receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                print("Error: \(error)")
            }
        },
        receiveValue: { todo in
            print("Received Todo: \(todo)")
        }
    )
